To enter the environment:

```
docker build . -t audio-plugins:latest
docker run --rm -it -v $(pwd):/usr/local/project audio-plugins:latest
```

Then inside the environment, we can build.

```
cross xtask bundle <pkg> --release --target x86_64-pc-windows-gnu
cross xtask bundle <pkg> --release
```
