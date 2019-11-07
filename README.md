### Running Wizeline Selenium Test Automation - Hometask

#### Prerequisites (OPTIONAL)
  - NOTE: Perform this step if you want to see the test automation via VNC viewer
  - Download VNC Viewer
    [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

#### 1. Build and Run Docker Container
  - Change directory to `wizeline-hometask`
  - Build Dockerfile
    ```bash
    $ docker build --tag=kierra/wizeline_hometask:latest .
    ```
  - Or Pull container from DockerHub repository
    ```bash
    $ docker pull kierra/wizeline_hometask:latest
    ```

  - Run container
    ```bash
    $ docker run -p 5920:5920 -d -ti --rm --name home-task kierra/wizeline_hometask:latest
    ```

#### 2. Run VNC Server (OPTIONAL)
  - NOTE: Perform this step if you want to see the test automation via VNC viewer
    ```bash
    $ docker exec -ti home-task bash -c -l "./run.sh"
    ```

#### 3. Connect to VNC Server from VNC Viewer (OPTIONAL)
  - NOTE: Perform this step if you want to see the test automation via VNC viewer
  * Open VNC viewer
  * Enter `localhost:5920` to VNC Viewer's address bar
  * Enter `wizeline` to password prompt

#### 4. Run test
  - Run the Selenium test automation
    ```bash
    $ docker exec -ti home-task bash -c -l "./run_test.sh"
    ```