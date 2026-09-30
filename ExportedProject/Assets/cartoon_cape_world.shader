Shader "DianDian/TD/Cartoon_Cape_World" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
		[Header(Middle)] _MiddleColor ("Middle Color", Vector) = (1,1,1,1)
		_MiddleRange ("Middle Range", Range(0, 1)) = 0.5
		_MiddleEdge ("Middle Edge", Range(0, 0.5)) = 0
		[Header(Dark)] _DarkColor ("Dark Color", Vector) = (1,1,1,1)
		_DarkRange ("Dark Range", Range(0, 1)) = 0.5
		_DarkEdge ("Dark Edge", Range(0, 0.5)) = 0
		[Header(Shadow)] [KeywordEnum(Multiply, Color)] _ShadowMode ("Shadow Mode", Float) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		_ShadowColor ("Shadow Color", Vector) = (0,0,0,1)
		[Header(Rim)] [KeywordEnum(Off, On)] _UseRim ("Use Rim", Float) = 0
		_RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimRange ("Rim Range", Range(0, 1)) = 0.5
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		[Header(PointLight)] [KeywordEnum(Off, On)] _PointLight ("Use PointLight", Float) = 0
		_PointId ("Point Id", Float) = 0
		_PointPowInv ("Point Pow Inv", Range(0.0001, 16)) = 1
		_PointMiddleRange ("Point Middle Range", Range(0, 1)) = 0.5
		_PointMiddleEdge ("Point Middle Edge", Range(0, 0.5)) = 0
		_PointDarkRange ("Point Dark Range", Range(0, 1)) = 0.5
		_PointDarkEdge ("Point Dark Edge", Range(0, 0.5)) = 0
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