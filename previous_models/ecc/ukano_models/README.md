Ukano takes as input only two parties protocols. Authorization has three agents,
but we can still at least check each connection individually. It's obviously not
enough: this only covers attacks where the attacker has a access to one channel,
nothing is yet proven for attacks where the both channels are controlled.

* authorization_ea-aa.pv models the connection between the AA and the EA
* authorization_station-aa.pv models the connection between the car and the AA

Enrolment fits into the requirements of Ukano.

* enrolment.pv models an enrolment request by the car

These files have slight differences with their original versions meant for
ProVerif, mostly to match Ukano requirements.

Once these files are given to Ukano, it outputs files testing frame opacity and
well authentication. However, these files are not valid input for ProVerif:

* They use internal functions, that are considered undefined during input
* They erase some types, making the type-checker fail

These files have been edited by hand to make them valid. They are

* enrolment_FOpa.pv
* enrolment_WAuth.pv
* authorization_station-aa_FOpa.pv
* authorization_station-aa_WAuth.pv
