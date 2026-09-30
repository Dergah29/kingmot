Shader "DianDian/TD/Cartoon_PBR_Hair_Fade" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
		[Header(Fade)] [NoScaleOffset] _FadeMap ("Fade Tex", 2D) = "white" {}
		_FadeRange ("Fade Range", Range(0, 1)) = 0
		_FadePow ("Fade Pow", Range(0.01, 8)) = 1
		_FadeLerp ("Fade Lerp", Range(0, 1)) = 1
		[Header(Middle)] _MiddleColor ("Middle Color", Vector) = (1,1,1,1)
		_MiddleRange ("Middle Range", Range(0, 1)) = 0.5
		_MiddleEdge ("Middle Edge", Range(0, 0.5)) = 0
		[Header(Shadow)] [NoScaleOffset] _ShadowRamp ("Shadow Ramp", 2D) = "black" {}
		_ShadowDark ("Shadow Dark", Vector) = (0,0,0,1)
		_ShadowColor ("Shadow Color", Vector) = (1,1,1,1)
		_ShadowSmoothness ("Shadow Smoothness", Range(0, 1)) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		[Header(Normal)] [KeywordEnum(Off, On)] _NormalMap ("Use Normal Map", Float) = 0
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		_NormalStrength ("Normal Strength", Range(0.01, 2)) = 1
		[Header(Specular)] _MaskMap ("Mask(R:offset G:specular B:noise A:Rim)", 2D) = "white" {}
		[Toggle] _NoiseUseUV2 ("Noise Use UV2", Float) = 0
		_SpecColor1 ("SpecColor1", Vector) = (1,1,1,1)
		_SpecColor2 ("SpecColor2", Vector) = (1,1,1,1)
		_Shift1 ("Shift1", Range(-1, 1)) = 0
		_Shift2 ("Shift2", Range(-1, 1)) = 0
		_Gloss1 ("Gloss1", Float) = 64
		_Gloss2 ("Gloss2", Float) = 64
		_SpecScale ("SpecScale", Range(0, 4)) = 1
		_ShadowSpecScale ("Shadow SpecScale", Range(0, 1)) = 0.2
		[Header(FlowMap)] [KeywordEnum(Off, On)] _UseFlow ("Use Flowmap", Float) = 0
		[NoScaleOffset] _FlowMap ("Flow Map", 2D) = "black" {}
		[Header(Reflections)] [KeywordEnum(Off, On)] _Reflections ("Use Reflections", Float) = 0
		[NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_Smoothness ("Smoothness", Range(0, 1)) = 0.5
		[Header(Rim)] [KeywordEnum(None, Default, MatCap)] _UseRim ("Use Rim", Float) = 0
		_RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimRange ("Rim Range", Range(0, 1)) = 0.5
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		[NoScaleOffset] _RimMatCapMap ("Rim MatCap Map", 2D) = "white" {}
		_RimStrength ("Rim Strength", Range(0.01, 10)) = 1
		[Header(Outline)] [NoScaleOffset] _OutlineMap ("Outline Map", 2D) = "black" {}
		_OutlineWidth ("Outline Width", Range(0, 50)) = 1
		_OutlineStrength ("Outline Color Strength", Range(0.01, 10)) = 1
		_Stencil ("Stencil ID", Float) = 1
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