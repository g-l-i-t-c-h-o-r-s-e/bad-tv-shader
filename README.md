# Bad TV Shader for Three.js - Modified for Canvas Capturing

I had to modify it slightly to remove the stat FPS canvas so we can capture whats going on! <3                                       
If you see this Felix, could u pls give us an option to natively record the output ;-;                                                                    
It Simulates a bad TV via horizontal distortion and vertical roll. 

## How To:
• (More to come, including full automation?)    

• Install [NodeJS](https://nodejs.org/en/)                                                                             
• In the `index.html` change the line `video.src = 'res/fits.mp4';` to whatever file you want.                                           
• Open command prompt and run: `npm install http-server -g`, cd to the "example" folder                                                                                  
 and run `http-server`, make sure index.html is inside this folder.                               
• Run `npm install -g timecut` so we can capture the canvas.                                                                         
• Use whichever IP is shown after running: `http-server` and then in a seperate command prompt, run: `timecut "http://192.168.56.1:8080" --executable-path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --no-headless --canvas-capture-mode immediate:png --viewport=1080,720 --duration=12 --output=CANVASOUTPUT.mp4`                                                         
• Apply FFmpeg filters to make it look more like an CRT Monitor, and join original audio: `ffmpeg -i CANVASOUTPUT.mp4 -i originalaudio.webm -lavfi "[0:v]vignette,vignette,format=gbrp,lenscorrection=k1=0.2:k2=0.2[out1];[out1]split[a][b];[b]boxblur=26,format=gbrp[b];[b][a] blend=all_mode=screen:shortest=1[out2]" -map "[out2]" -map 1:a -f mp4 -q:v 0 -pix_fmt yuv420p -t 12 Final.mp4`, Also `-t 12` should be set to how long `--duration=12` was or however long you wanted the output file to be, to avoid audio duration glitch. [Borrowed From Here:](http://oioiiooixiii.blogspot.com/2019/04/ffmpeg-crt-screen-effect.html)                                                                                                  
• PROFIT: https://streamable.com/yo70s <3 https://streamable.com/smfar

## Original Demo <3

[View Demo](http://felixturner.github.io/bad-tv-shader/example/)

## Uniforms
* **time** steadily increasing float passed in
* **distortion** amount of thick distortion
* **distortion2** amount of fine grain distortion
* **speed** distortion vertical travel speed
* **rollSpeed** vertical roll speed


## Usage

```javascript
composer = new THREE.EffectComposer( renderer);
renderPass = new THREE.RenderPass( scene, camera );
badTVPass = new THREE.ShaderPass( THREE.BadTVShader );
composer.addPass( renderPass );
composer.addPass( badTVPass );
badTVPass.renderToScreen = true;
```

View demo for full usage details.

## Credits

Uses [Ashima WebGL Noise](https://github.com/ashima/webgl-noise), [three.js](https://github.com/mrdoob/three.js/)                                  
All Credit goes to the Original Author/Owner [Felix Turner](https://github.com/felixturner/bad-tv-shader), I claim no rights to this and only want to share this awesome tool with others who cannot program and want to achieve this marvelous effect with the built-in example page, as well as capture it for their viewing pleasure :> 

## License

MIT © [Felix Turner](http://airtight.cc)
