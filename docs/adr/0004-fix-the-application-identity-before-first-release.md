# Fix the application identity before first release

The app uses `cc.ivanli.fastpotifykeys` as its bundle identifier. Accessibility authorization, preferences, and login-item registration are associated with this identity, so changing it after distribution would require people to grant access and configure the app again.
