Shader "DianDian/Build/River" {
	Properties {
		_ControlTex ("Control(rg:Crack, b:Deep)", 2D) = "white" {}
		_DeepColor ("DeepColor", Vector) = (1,1,1,1)
		_ShallowColor ("ShallowColor", Vector) = (1,1,1,1)
		_DeepTilingAndOffset ("Deep Tiling And Offset", Vector) = (1,1,0,0)
		_CrackColor ("CrackColor", Vector) = (1,1,1,1)
		_CrackUnderColor ("CrackUnderColor", Vector) = (1,1,1,1)
		_LayerOffset ("Layer Param(xy:Offset, zw:Strength)", Vector) = (0,0,0,0)
		[NoScaleOffset] _SmoothnessTex ("Smoothness Tex", 2D) = "black" {}
		_SmoothnessScale ("Smoothness Scale", Range(0, 1)) = 0.5
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
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