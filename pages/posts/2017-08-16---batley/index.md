---
title: batley
date: '2017-08-16'
layout: post
path: /batley/
---
Step 2: Merge all bugs into a single CSV file

We need a giant CSV of all these bugs. There is probably a better way to do this, but I merged them all manually in google docs:

Create a google docs spreadsheet, I called mine “JIRA Bug Dump”
Open up as many tabs as you have spreadsheets that got downloaded in Step 1 (trust me on this)
For each tab, go to File -> Import -> Upload and upload JIRA (i).xls (where i is the index of the sheet)
Insert the upload as a new sheet in the document
Once all sheets are inserted, create a new blank sheet (this is your “master” sheet)
Copy in the column headings from one of the sheets
Copy in the bugs from all the other sheets into this blank sheet (watch out for the extra cell JIRA creates at the end of each sheet)
Export this “master” sheet as a CSV, I named mine dump.csv
If anyone knows a more efficient way to do this, by all means go ahead!