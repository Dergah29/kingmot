Shader "DianDian/TD/Cartoon_PBR_Character_NoLOD" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
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
		[Header(Specular)] [NoScaleOffset] _MaskMap ("Mask(R:Metallic G:Smoothness B:Rim A:Reflections)", 2D) = "white" {}
		_SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		_Metallic ("Metallic", Range(0, 1)) = 0.5
		_Smoothness ("Smoothness", Range(0, 1)) = 0.5
		[Header(Emission)] [KeywordEnum(Off, On)] _Emission ("Use Emission", Float) = 0
		[HDR] _EmissionColor ("Emission Color", Vector) = (0,0,0,1)
		[Header(Reflections)] [KeywordEnum(Off, On)] _Reflections ("Use Reflections", Float) = 0
		[NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		[Header(Rim)] [KeywordEnum(None, Default, MatCap)] _UseRim ("Use Rim", Float) = 0
		_RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimRange ("Rim Range", Range(0, 1)) = 0.5
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		[NoScaleOffset] _RimMatCapMap ("Rim MatCap Map", 2D) = "white" {}
		_RimStrength ("Rim Strength", Range(0.01, 10)) = 1
		[Header(Outline)] [NoScaleOffset] _OutlineMap ("Outline Map", 2D) = "black" {}
		_OutlineWidth ("Outline Width", Range(0, 50)) = 1
		_Stencil ("Stencil ID", Float) = 1
		[Header(Dissolve)] [KeywordEnum(Off, On)] _UseDissolve ("Use Dissolve", Float) = 0
		_DissolveMap ("Dissolve Map", 2D) = "white" {}
		_DissolveValue ("Dissolve Value", Range(0, 1)) = 0
		_DissolveRange ("Dissolve Range", Range(0, 0.2)) = 0.1
		_DissolvePow ("Dissolve Pow", Range(0.001, 8)) = 1
		[HDR] _DissolveColor ("Dissolve Color", Vector) = (1,1,1,1)
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