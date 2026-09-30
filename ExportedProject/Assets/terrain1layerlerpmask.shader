Shader "DianDian/Terrain/1 Layer Lerp Mask" {
	Properties {
		[NoScaleOffset] _EdgeMask ("Edge Mask", 2D) = "White" {}
		[Header(Terrain 1)] [NoScaleOffset] _Splat1 ("Splat 1", 2D) = "black" {}
		_SplatTiling1 ("Splat tiling", Vector) = (1,1,1,1)
		[Header(Terrain 2)] [NoScaleOffset] _Splat2 ("Splat 1", 2D) = "black" {}
		_SplatTiling2 ("Splat tiling", Vector) = (1,1,1,1)
		[Header(Terrain)] _TerrainLerp ("Terrain Lerp", Range(0, 1)) = 0
		_Width ("Width", Float) = 1200
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