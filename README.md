## Dependencies

[ProVerif](https://prosecco.gforge.inria.fr/personal/bblanche/proverif)
and [UKano](http://projects.lsv.ens-cachan.fr/ukano/) can be retrieved using the
provided script:

```
$ ./install_dependencies.sh
```

It will download the sources of the two tools and compile them. UKano is only
required to regenerate models, otherwise ProVerif is enough to run them.

## ProVerif Models

* `lib.pvl` library containing the equational theory used in our models
* `enrolment.pv` models a station (vehicule) requesting an Enrolment Certificate,
checks for secrecy of the station ID, authentication of the EA and authenticity
of the request
* `authorization.pv` models a station requesting a Authorization Ticket (the
station is assumed to already have a Enrolment Certificate), checks that an AT
cannot be obtained without EA approval and the authenticity of ECSignature

## Unlinkability

* `*_FOpa.pv` frame opacity proofs
* `*_WAuth.pv` well-authentication proofs

### During enrolment

```
$ ./proverif ukano_models/enrolment_FOpa.pv
$ ./proverif ukano_models/enrolment_WAuth.pv
```

### During authorization, attacking exchanges between Station and AA

```
$ ./proverif ukano_models/authorization_station-aa_FOpa.pv
$ ./proverif ukano_models/authorization_station-aa_Wauth.pv
```

### During authorization, attacking exchanges between AA and EA

```
$ ./proverif ukano_models/authorization_aa-ea_FOpa.pv
$ ./proverif ukano_models/authorization_aa-ea_Wauth.pv
```

### During authorization, malicious AA

```
$ ./proverif ukano_models/authorization_station-ea_FOpa.pv
$ ./proverif ukano_models/authorization_station-ea_Wauth.pv
```

## Proposed fix

* Making sure the AA checks the date of the signature of sharedATRequest can
provide some mitigation, but formally speaking only reduces the time window
during which the attack on unlinkability could happen.
* Forcing Stations to make an enrolment request before each authorization request
does intituively remove entirely the attack. However, the resulting protocol
still shows a trace against frame opacity. While a trace on frame opacity does not
necessarily leads to a trace against unlinkability, we still end up on a protocol
that we fail to prove to have unlinkability.
* We propose here a protocol that is provably unlinkable. We replace the validation
request with a ticket that the EA has to provide to the station during enrolment.
A ticket should only be used once.

```
$ ./proverif ukano_models/fix_enrolment_FOpa.pv
$ ./proverif ukano_models/fix_enrolment_WAuth.pv
$ ./proverif ukano_models/fix_authorization_station-aa_FOpa.pv
$ ./proverif ukano_models/fix_authorization_station-aa_WAuth.pv
```

## Misc: previous models

A first model was tried be modeling the full description of ECIES, using an
equational theory to model elliptic curves. This however lead to difficulties,
with more than 32GB of RAM used and non-termination issues, notably while trying
to prove unlinkability. These models can be found in `previous_models/ecc`
subfolder. Other models instead make abstraction of ECIES.

Secondly, we did not first model the fact that signed structures also contains
a date in their headers, leading to possible attacks on unlinkability. Theses
models can be found in subfolders `without_nonce`.
