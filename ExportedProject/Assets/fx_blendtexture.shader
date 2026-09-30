Shader "630VFX/BlendTexture" {
	Properties {
		[Toggle] _Desaturate ("Desaturate", Float) = 0
		[Toggle(_ALPHARED_ON)] _AlphaRed ("Alpha/Red", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 0
		[Enum(ADD,1,Alpha,10)] _Dst ("Dst", Float) = 10
		[Enum(Less,2,Disabled,0)] _ZTestMode ("ZTest Mode", Float) = 2
		_Indensity ("Indensity", Float) = 1
		_Indensity_Power ("Indensity_Power", Float) = 1
		_Opacity ("Opacity", Float) = 1
		[HDR] _Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex", 2D) = "white" {}
		_MainU ("MainU", Float) = 0
		_MainV ("MainV", Float) = 0
		_DepthFade1 ("DepthFade", Float) = 0
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