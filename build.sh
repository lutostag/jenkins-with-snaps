#!/bin/sh
charm build -s xenial -n jenkins-with-snaps
cd xenial/jenkins-with-snaps
URL=$(charm push . cs:~oil-charms/jenkins | sed -n '1{s/url: //p}')
charm release $URL --channel edge
charm grant $URL everyone
charm grant cs:~oil-charms/jenkins --channel edge everyone
