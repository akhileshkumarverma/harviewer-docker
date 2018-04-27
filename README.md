Stable URL (v2.0.17, 21 March 2016) - http://www.softwareishard.com/har/viewer/

Up-to-date master - http://gitgrimbo.github.io/harviewer/master/ (and [https](https://gitgrimbo.github.io/harviewer/master/))

# HAR Viewer

* Author: Jan Odvarko, odvarko@gmail.com
* http://www.softwareishard.com/
* Issue list: https://github.com/janodvarko/harviewer/issues
* Project home: https://github.com/janodvarko/harviewer
* Dockerized Solution: https://github.com/marcellodesales/harviewer-docker

## Running

```apache
$ docker run -ti -p 8080:80 marcellodesales/harviewer
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Fri Apr 27 01:23:31.060437 2018] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.2.4 configured -- resuming normal operations
[Fri Apr 27 01:23:31.061116 2018] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
```

## Testing

<img src="https://preview.ibb.co/i4nr9H/Screen_Shot_2018_04_26_at_6_23_52_PM.png" alt="Screen_Shot_2018_04_26_at_6_23_52_PM">

* Request

```html
$ curl http://localhost:8080/\?har\=examples/google.com.har
<!doctype html>
<html>
<head>
    <title>HTTP Archive Viewer 2.0.17</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/harViewer.css" type="text/css">
</head>
<body class="harBody">
    <div id="content" version="2.0.17"></div>
    <script src="scripts/jquery.js"></script>
    <script data-main="scripts/harViewer" src="scripts/require.js"></script>

<!-- Google Analytics -->
<script>
// Enable Google Analytics (for publicly hosted instances) in ant.properties file
// by setting GOOGLE-ANALYTICS-PROFILE property to ID of your profile.
var googleAnalyticsProfile = "";
if (googleAnalyticsProfile && googleAnalyticsProfile.charAt(0) !== "@") {

    window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
    ga('create', googleAnalyticsProfile, 'auto');
    ga('send', 'pageview');

}
</script>
<script async src='https://www.google-analytics.com/analytics.js'></script>
<!-- End Google Analytics -->

</body>
</html>
```

* Backend

```apache
$ docker run -ti -p 8080:80 marcellodesales/harviewer
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Fri Apr 27 01:24:54.733246 2018] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.25 (Debian) PHP/7.2.4 configured -- resuming normal operations
[Fri Apr 27 01:24:54.733325 2018] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
172.17.0.1 - - [27/Apr/2018:01:25:17 +0000] "GET /?har=examples/google.com.har HTTP/1.1" 200 858 "http://localhost:8080/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
172.17.0.1 - - [27/Apr/2018:01:25:32 +0000] "GET /?har=examples/google.com.har HTTP/1.1" 200 1215 "-" "curl/7.54.0"
```
