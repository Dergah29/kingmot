Shader "DianDian/Scene/Fog" {
	Properties {
		[NoScaleOffset] _NoiseTex ("Noise", 2D) = "white" {}
		_Tiling ("Tiling(xy: Layer1 Tiling, zw: Layer2 Tiling)", Vector) = (1,1,1,1)
		_FogSpeed ("Fog Speed(xy: Layer1 Speed, zw: Layer2 Speed)", Vector) = (0,0,0,0)
		_FogColor ("Fog Color", Vector) = (1,1,1,1)
		_FogDensity ("Fog Density", Range(0, 2)) = 1
		_NoiseAmount ("Noise Amount", Range(0, 2)) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
}