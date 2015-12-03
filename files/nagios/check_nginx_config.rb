#!/usr/bin/ruby

retvals = system("/usr/sbin/nginx -t") == true ? {:status => "OK - Nginx config looks good.", :code => 0} : {:status => "CRITICAL - Nginx failed to load. Check config", :code => 2}
puts retvals[:status]
exit retvals[:code]