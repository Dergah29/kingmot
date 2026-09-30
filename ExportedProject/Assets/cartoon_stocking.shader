Shader "DianDian/TD/Cartoon_Stocking" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
		[Header(Shadow)] [NoScaleOffset] _ShadowRamp ("Shadow Ramp", 2D) = "black" {}
		_ShadowSmoothness ("Shadow Smoothness", Range(0, 1)) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		[Header(Normal)] [KeywordEnum(Off, On)] _NormalMap ("Use Normal Map", Float) = 0
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		_NormalStrength ("Normal Strength", Range(0.01, 2)) = 1
		[Header(StockingNormal)] [KeywordEnum(Off, On)] _StockingNormalMap ("Use Stocking Normal Map", Float) = 0
		[Normal] _StockingBumpMap ("Stocking Normal Map", 2D) = "bump" {}
		_StockingNormalStrength ("Stocking Normal Strength", Range(0.01, 2)) = 1
		[Header(Specular)] _MaskMap ("Mask(R:offset G:specular B:strength)", 2D) = "white" {}
		_SpecColor1 ("SpecColor1", Vector) = (1,1,1,1)
		_Shift1 ("Shift1", Range(-1, 1)) = 0
		_Gloss1 ("Gloss1", Float) = 64
		_SpecScale ("SpecScale", Range(0, 4)) = 1
		_ShadowSpecScale ("Shadow SpecScale", Range(0, 1)) = 0.2
		[Header(Reflections)] [KeywordEnum(Off, On)] _Reflections ("Use Reflections", Float) = 0
		[NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_Smoothness ("Smoothness", Range(0, 1)) = 0.5
		[Header(Rim)] _RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		_RimPowMax ("Rim Pow Max", Range(0, 1)) = 0.8
		_RimPowMin ("Rim Pow Min", Range(0, 1)) = 0
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