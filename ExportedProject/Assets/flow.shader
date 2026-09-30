Shader "DianDian/Scene/Flow" {
	Properties {
		[Header(Main)] _MainCol ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex(RGB:Main Color)(A:ShiningMask)", 2D) = "white" {}
		[Header(Flow Map)] _FlowMap ("Flow Map(RG:Flow Map)", 2D) = "white" {}
		_FlowStrength ("Flow Strength", Range(0, 10)) = 1
		_FlowSpeed ("Flow Speed", Range(0, 5)) = 1.8
		[Toggle] _FlowReverse ("Flow Reverse", Float) = 0
		[Header(Mask)] _MaskTex ("MaskTex", 2D) = "black" {}
		_MaskStrength ("Mask Strength", Range(0, 100)) = 1
		_MaskTexAngle ("MaskTex Angle", Range(0, 360)) = 0
		_MaskTexSpeed_U ("MaskTex Speed U", Range(0, 2)) = 0.1
		_MaskTexSpeed_V ("MaskTex Speed V", Range(0, 2)) = 0.1
		_MaskShiningSpeed ("Mask Shining Speed", Range(0, 5)) = 1
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

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy);
			}

			ENDHLSL
		}
	}
}