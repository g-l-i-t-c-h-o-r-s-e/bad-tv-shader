# Bad TV Shader for Three.js - Modified for Canvas Capturing

I had to modify it slightly to remove the stat FPS canvas so we can capture whats going on! <3                                        
It Simulates a bad TV via horizontal distortion and vertical roll. 

## How To
• Install [NodeJS](https://nodejs.org/en/)                                                                             
• Open command prompt and run: `npm install http-server -g`, and run `http-server` in the example folder with index.html inside.                               
• Run `npm install -g timecut` so we can capture the canvas.                                                                         
• Use whichever IP is shown after running: `http-server` and then in a seperate command prompt, run: `timecut "http://192.168.56.1:8080" --executable-path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --no-headless --canvas-capture-mode immediate:png --viewport=1080,720 --duration=12 --output=CANVASOUTPUT.mp4`

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
All Credit goes to the Original Author/Owner [Felix Turner](https://github.com/felixturner/bad-tv-shader) I claim no rights so this and only want to share this awesome tool with others who cannot program and want to achieve this marvelous effect with the built-in example page, as well as capture it for their viewing pleasure :> 

## License

MIT © [Felix Turner](http://airtight.cc)
