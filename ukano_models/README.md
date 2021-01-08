On our models, UKano does not directly produces valid input for proverif.

A script is provided that does the automatable part of producing theses models.

```
./ukano_wrapper.sh enrolment.pv
```

Then, files are reviewed by hand. UKano uses the internal representation of
ProVerif of the model and prints it to a file, but some functions used by
ProVerif internally are not considered valid input, notably functions related to
tuples manipulation.
