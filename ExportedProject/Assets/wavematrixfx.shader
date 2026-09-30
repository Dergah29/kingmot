Shader "DianDian/FX/WaveMatrixFx" {
	Properties {
		[Header(Main)] _MainTex ("MainTex", 2D) = "white" {}
		_MainCol ("Main Color", Vector) = (1,1,1,1)
		[KeywordEnum(Off, On)] _UseUVMove ("US UVMove", Float) = 0
		_MainTexAngle ("MainTex Angle", Range(0, 360)) = 0
		_MainTexSpeed_U ("MainTex Speed U", Float) = 0
		_MainTexSpeed_V ("MainTex Speed V", Float) = 0
		[Header(Other)] _Mask ("Mask(R:mask,G:move)", 2D) = "white" {}
		_Icon ("Icon", 2D) = "white" {}
		_IconClip ("Icon Clip", Vector) = (1,0,0,0)
		_IconMul ("Icon Mul", Range(0.1, 20)) = 1
		_WaveSpeed ("Wave Speed", Float) = 1
		_WaveCycle ("Wave Cycle", Float) = 1
		_WaveRangeF ("Wave RangeF", Range(0, 1)) = 0.5
		_WaveRangeB ("Wave RangeB", Range(0, 1)) = 0.5
		_WavePow ("Wave Pow", Range(0.001, 8)) = 1
		[Header(Rendering)] [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Src Blend Mode", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Dst Blend Mode", Float) = 10
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