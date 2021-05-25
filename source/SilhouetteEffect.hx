package;

// STOLEN FROM HAXEFLIXEL DEMO LOL
import flixel.system.FlxAssets.FlxShader;

class SilhouetteEffect
{
	public var shader(default, null):SilhouetteShader = new SilhouetteShader();
  public var darkness(default, set):Float = 1;

	public function new():Void
	{
		shader.uDark.value = [1];
		darkness = 1;
	}

  function set_darkness(v:Float):Float
	{
		darkness = v;
		shader.uDark.value = [v];
		return v;
	}


}

class SilhouetteShader extends FlxShader
{
	@:glFragmentSource('
	uniform float uDark = 0.5;
	#pragma header
	void main()
	{
	    // Normalized pixel coordinates (from 0 to 1)
	    vec2 uv = openfl_TextureCoordv;

	    // Time varying pixel color
	    vec4 Color = texture2D(bitmap, uv);

	    // Output to screen
	    gl_FragColor = vec4(Color.x-uDark,Color.y-uDark,Color.z-uDark,1) * Color.a;
	}
	')
	public function new()
	{
		super();
	}
}
