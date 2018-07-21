set USE_MOCK=true
set video_port = 8092
set photoDirectory="D:\temp\nodemock"
set video_url="http://localhost:8092/?action=stream"
D:
CD "D:\AAAProjects\AAAopenROV\Image\Image30.0.3Dev\opt\openrov\cockpit\src\"
REM node cockpit.js
node --inspect cockpit.js