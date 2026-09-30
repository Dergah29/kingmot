Shader "630VFX/fx_Particle+Distortion+Dissolve_x" {
	Properties {
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 0
		[Enum(ADD,1,Alpha,10)] _Dst ("Dst", Float) = 10
		[Enum(Less,2,Disabled,0)] _ZTestMode ("ZTest Mode", Float) = 2
		_Indensity ("Indensity", Float) = 1
		_Indensity_Power ("Indensity_Power", Float) = 1
		_Opacity ("Opacity", Float) = 1
		_Opacity_Power ("Opacity_Power", Float) = 1
		[HDR] _Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex", 2D) = "white" {}
		_MainU ("MainU", Float) = 0
		_MainV ("MainV", Float) = 0
		_DistortionTex ("DistortionTex", 2D) = "white" {}
		_DistortionIndensity ("DistortionIndensity", Float) = 0
		_DistortionU ("DistortionU", Float) = 0
		_DistortionV ("DistortionV", Float) = 0
		_AlphaTex ("AlphaTex", 2D) = "white" {}
		[Toggle(_DISTORTIONTOALPHA_ON)] _DistortionTOAlpha ("DistortionTOAlpha", Float) = 0
		_AlphaU ("AlphaU", Float) = 0
		_AlphaV ("AlphaV", Float) = 0
		_Dissolve_tex ("Dissolve_tex", 2D) = "white" {}
		[Toggle(_DISSOLVE_ON)] _Dissolve ("Dissolve", Float) = 0
		[Toggle(_DISTORTIONTODISSOLVE_ON)] _DistortionTODissolve ("DistortionTODissolve", Float) = 0
		_Dissolve_U ("Dissolve_U", Float) = 0
		_Dissolve_V ("Dissolve_V", Float) = 0
		_DepthFade1 ("DepthFade", Float) = 0
		[HideInInspector] _tex4coord2 ("", 2D) = "white" {}
		[HideInInspector] _texcoord ("", 2D) = "white" {}
		[HideInInspector] __dirty ("", Float) = 1
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
			float4 _MainTex_ST;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.uv = (input.uv.xy * _MainTex_ST.xy) + _MainTex_ST.zw;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;
			float4 _Color;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy) * _Color;
			}

			ENDHLSL
		}
	}
	//CustomEditor "ASEMaterialInspector"
}