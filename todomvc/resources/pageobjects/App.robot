*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open todoMVC application
    Set tags     ${BROWSER}
    Open browser      ${TODOMVC_URL}    ${BROWSER}    remote_url=http://localhost:4444/wd/hub/    desired_capabilities=name:${TEST_NAME},build:${ENV}




docker run --rm -ti --name zalenium -p 4444:4444 -v /var/run/docker.sock:/var/run/docker.sock -v /Users/Jakub/Video:/home/seluser/videos --privileged dosel/zalenium start