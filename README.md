
```
.
├── proverif_models
│   ├── ecc
│   │   ├── authorization.pv
│   │   ├── enrolment.pv
│   │   └── lib.pvl
│   ├── with_nonce
│   │   ├── authorization.pv
│   │   ├── enrolment.pv
│   │   └── lib.pvl
│   └── without_nonce
│       ├── authorization.pv
│       ├── enrolment.pv
│       └── lib.pvl
└── ukano_models
    ├── authorization.pv
    ├── ecc
    │   ├── authorization_station-aa_FOpa.pv
    │   ├── authorization_station-aa.pv
    │   ├── authorization_station-aa_WAuth.pv
    │   ├── enrolment_FOpa.pv
    │   ├── enrolment.pv
    │   └── enrolment_Wauth.pv
    ├── with_nonce
    │   ├── authorization_station-aa_FOpa.pv
    │   ├── authorization_station-aa.pv
    │   ├── authorization_station-aa_WAuth.pv
    │   ├── enrolment_FOpa.pv
    │   ├── enrolment.pv
    │   ├── enrolment_WAuth.pv
    │   └── lib.pvl
    └── without_nonce
        ├── authorization_station-aa_FOpa.pv
        ├── authorization_station-aa.pv
        ├── authorization_station-aa_WAuth.pv
        ├── enrolment_FOpa.pv
        ├── enrolment.pv
        ├── enrolment_WAuth.pv
        └── lib.pvl

```


## Models

A first model was tried be modeling the full description of ECIES, using an
equational theory to model elliptic curves. This however lead to difficulties,
with more than 32GB of RAM used and non-termination issues, notably while trying
to prove unlinkability. These models can be found in `ecc` subfolders. Other
models instead make abstraction of ECIES.

Secondly, we did not first model the fact that signed structures also contains
a date in their headers, leading to possible attacks on unlinkability. Theses
models can be found in subfolders `without_nonce`.

Models that model this fact more correctly are stored in subfolders `with_nonce`

## ProVerif Models

* `lib.pvl` library containing all the primitives used in our models
* `enrolment.pv` models a station (vehicule) requesting an Enrolment Certificate
* `authorization.pv` models a station requesting a Authorization Ticket (the station is assumed to already have a Enrolment Certificate)

## Ukano Models

* `*_FOpa.pv` frame opacity proofs
* `*_WAuth.pv` well-authentication proofs
