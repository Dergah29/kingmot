Shader "DianDian/World/FogKingdomState" {
	Properties {
		[NoScaleOffset] _NoiseTex ("Noise", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_Density ("Density", Range(0, 2)) = 1
		_NoiseAmount ("Noise Amount", Range(0, 2)) = 1
		_Tiling1 ("Tiling1(x:size,y:tiling,zw:speed)", Vector) = (1,1,1,1)
		_Tiling2 ("Tiling2(x:size,y:tiling,zw:speed)", Vector) = (1,1,1,1)
		_Tiling3 ("Tiling3(x:size,y:tiling,zw:speed)", Vector) = (1,1,1,1)
		_Tiling4 ("Tiling4(x:size,y:tiling,zw:speed)", Vector) = (1,1,1,1)
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
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

			float4 _Color;

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return _Color; // RGBA
			}

			ENDHLSL
		}
	}
}