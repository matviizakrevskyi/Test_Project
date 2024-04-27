# CV Project

#### The project consists of three screens:

 * **The first screen** contains a timer and a button to start it, with pulsation animations. If you click on the timer when it is not running, you can select the time for the timer.

 * **The second screen** contains a map view and location data in the form of text. When you enter this screen, a method is executed that takes data from this service:  https://ip-api.com/, for which I used the **Dio** library. After the data has been downloaded, the screen is updated with this data. There is also a **pull-to-refresh** function on the screen, and a "Reload" button at the bottom of the screen to refresh the data.

 * **The third screen** contains several buttons: Button to change the **localization** (there are two in the project: English and German), **Rate App** button to open the app rating view, **Share App button** to open the share view, **Contact us** button to open the browser with a link.

For navigation, there is a **tab bar** at the bottom of the screen.
For state management in the project, I used **BLoC**, namely Cubit.

**Important:** I'm not sure if the app will run on iOS, because I haven't tested it, because I don't have the appropriate equipment for this, but on Android everything should be OK

#### All libraries and tools used:

* BLoC
* Dio
* Easy Localization
* Share Plus
* Url Launcher
* Rate My App
* Json Annotation
* Json Serializable
* Flutter Map

## How to Use

### Step 1

Here is the link to clone the repository:

```
    https://github.com/matviizakrevskyi/Test_Project
```

### Step 2

Install dependencies:

```sh
    flutter pub get
```

### Step 3

Launch the app:

```sh
    flutter run
```