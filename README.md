# NagiosReporting
A quick script utilising WKHTML in order to generate PDFs from the Nagios Availability Reports


# Installing WKHTML
You can download a precompiled binary here: https://wkhtmltopdf.org/downloads.html
We prefer the qt patched version because it takes care of a lot of things that we otherwise would have to do manually

# Usage
The script basically iterates over an array of servers, appending their respective urls for the Availability report on each host to a URL string, and then feeds that URL string on to WKTHML. This way we can have a single PDF with all the hosts included on it.
The Reports are weekly (the value is hardcoded on the script), but they can easily be changed to whatever timespan you prefer by modifying the "STARTDATE" variable.

You can optionally mail the PDF using the "mail" utility.

I personally have this script running as a cronjob every Monday in order to be presented with the last week's overview.

#Notes
I could definitely handle some things better (first thing that comes to mind is exiting and reporting if one of the utilities is not available on the server)
