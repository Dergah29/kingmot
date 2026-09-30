Shader "DianDian/TD/Cartoon_Build_WaterSection" {
	Properties {
		[Header(Color)] _Color1 ("Color", Vector) = (1,1,1,1)
		_Color2 ("Color2", Vector) = (1,1,1,1)
		[Header(Normal)] _NormalTex ("Normal", 2D) = "bump" {}
		_NormalUVParam ("Normal UV Move(xy:dir1, zw:dir2)", Vector) = (1,1,1,1)
		_NormalScaleParam ("Normal Scale Move(xy:heightRange, z:scale)", Vector) = (0,1,0.5,0)
		[Header(Reflections)] [NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_RefStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_FresnelParam ("Fresnel Param(R:Min G:Max)", Vector) = (0.1,1,0,0)
		[Header(Specular)] _SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_SpecularPower ("Specular Power", Range(0.1, 128)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 4)) = 0
		_LightDir ("Light Dir", Vector) = (1,1,1,1)
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