Shader "DianDian/TD/Ice" {
	Properties {
		[Header(Base)] _ControlTex ("Control Map", 2D) = "white" {}
		[KeywordEnum(Off, On)] _SurfaceMap ("Use Surface Map", Float) = 0
		[NoScaleOffset] _SurfaceTex ("Surface Map", 2D) = "white" {}
		[HDR] _SurfaceColor ("Surface Color", Vector) = (1,1,1,1)
		[HDR] _DeepColor1 ("Deep Color1", Vector) = (1,1,1,1)
		[HDR] _DeepColor2 ("Deep Color2", Vector) = (1,1,1,1)
		[HDR] _DeepColor3 ("Deep Color3", Vector) = (1,1,1,1)
		[HDR] _DeepColor4 ("Deep Color4", Vector) = (1,1,1,1)
		_LayerOffset ("Layer Offset", Vector) = (0,0,0,0)
		_LayerStrength ("Layer Strength", Vector) = (0,0,0,0)
		_LayerTilingG ("G Tiling&Offset", Vector) = (1,1,0,0)
		_LayerTilingB ("B Tiling&Offset", Vector) = (1,1,0,0)
		[Header(Shadow)] _ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		_ShadowColor ("Shadow Color", Vector) = (0,0,0,1)
		[Header(Normal)] [KeywordEnum(Off, On)] _NormalMap ("Use Normal Map", Float) = 0
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		_NormalStrength ("Normal Strength", Range(0.01, 2)) = 1
		[Header(Specular)] _MaskMap ("Mask(R:Smoothness G:Noise)", 2D) = "white" {}
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_Smoothness ("Smoothness", Range(0, 1)) = 0.5
		[Header(Reflections)] [KeywordEnum(Off, On)] _Reflections ("Use Reflections", Float) = 0
		[NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_FresnelParam ("Fresnel Param(R:Min G:Max)", Vector) = (0.1,1,0,0)
		[Header(Glitter)] [KeywordEnum(Off, On)] _Glitter ("Use Glitter", Float) = 0
		_GlitterSparsity ("Glitter Sparsity", Range(0.01, 10)) = 1
		_GlitterStrength ("Glitter Strength", Range(0, 10)) = 1
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