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

* `lib.pvl` library containing all the primitives used in our models
* `enrolment.pv` models a station (vehicule) requesting an Enrolment Certificate
* `authorization.pv` models a station requesting a Authorization Ticket (the
station is assumed to already have a Enrolment Certificate)

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

### During authorization, attacker exchanges between AA and EA

```
$ ./proverif ukano_models/authorization_aa-ea_FOpa.pv
$ ./proverif ukano_models/authorization_aa-ea_Wauth.pv
```

### During authorization, malicious AA

```
$ ./proverif ukano_models/authorization_station-ea_FOpa.pv
$ ./proverif ukano_models/authorization_station-ea_Wauth.pv
```

## Previous Models

A first model was tried be modeling the full description of ECIES, using an
equational theory to model elliptic curves. This however lead to difficulties,
with more than 32GB of RAM used and non-termination issues, notably while trying
to prove unlinkability. These models can be found in `previous_models/ecc`
subfolder. Other models instead make abstraction of ECIES.

Secondly, we did not first model the fact that signed structures also contains
a date in their headers, leading to possible attacks on unlinkability. Theses
models can be found in subfolders `without_nonce`.
