# Bad TV Shader for Three.js - Modified for Canvas Capturing

I had to modify it slightly to remove the stat FPS canvas so we can capture whats going on! <3                                         
It Simulates a bad TV via horizontal distortion and vertical roll. 

## Demo

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
Original Author/Owner [Felix Turner](https://github.com/felixturner/bad-tv-shader), 

## License

MIT © [Felix Turner](http://airtight.cc)
