Shader "DianDian/TD/Cartoon_Diffuse_Unlit" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
		[Header(Middle)] _MiddleColor ("Middle Color", Vector) = (1,1,1,1)
		_MiddleRange ("Middle Range", Range(0, 1)) = 0.5
		_MiddleEdge ("Middle Edge", Range(0, 0.5)) = 0
		[Header(Shadow)] [KeywordEnum(Multiply, Color)] _ShadowMode ("Shadow Mode", Float) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		_ShadowColor ("Shadow Color", Vector) = (0,0,0,1)
		[Header(AlphaClip)] _AlphaClip ("Alpha Clip", Range(0, 1)) = 0
		[Header(Rim)] [KeywordEnum(Off, On)] _UseRim ("Use Rim", Float) = 0
		[HDR] _RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimRange ("Rim Range", Range(0, 1)) = 0.5
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		[Header(Dissolve)] [KeywordEnum(Off, On)] _UseDissolve ("Use Dissolve", Float) = 0
		_DissolveMap ("Dissolve Map", 2D) = "white" {}
		_DissolveValue ("Dissolve Value", Range(0, 1)) = 0
		_DissolveRange ("Dissolve Range", Range(0, 0.2)) = 0.1
		_DissolvePow ("Dissolve Pow", Range(0.001, 8)) = 1
		[HDR] _DissolveColor ("Dissolve Color", Vector) = (1,1,1,1)
		[Header(Cutoff)] [KeywordEnum(Off, On)] _UseCutoff ("Use Cutoff", Float) = 0
		_CutoffHeight ("Cutoff Height", Float) = 0
		[Header(Other)] [Toggle] _SetGray ("SetGray", Float) = 0
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