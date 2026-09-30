Shader "DianDian/TD/Aquarium" {
	Properties {
		[Header(Base)] _DeepColor ("Deep Color", Vector) = (1,1,1,1)
		_SurfaceColor ("Surface Color", Vector) = (1,1,1,1)
		_SurfaceTex ("Surface Map", 2D) = "white" {}
		[Header(Parallax)] _ControlTex ("Control Map", 2D) = "black" {}
		_Offset ("Offset", Range(0, 8)) = 1
		_Strength ("Strength", Range(0, 4)) = 0.5
		_Speed ("Speed", Vector) = (0,1,0,0)
		[Header(Reflections)] [NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_FresnelParam ("Fresnel Param(R:Min G:Max)", Vector) = (0.1,1,0,0)
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