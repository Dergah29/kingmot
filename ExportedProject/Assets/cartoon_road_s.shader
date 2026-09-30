Shader "DianDian/TD/Cartoon_Road_S" {
	Properties {
		[Header(Base)] _BaseMap ("Main Tex", 2D) = "white" {}
		_BaseColor ("Main Color", Vector) = (1,1,1,1)
		[Header(Noise)] _NoiseMap ("Noise Tex", 2D) = "white" {}
		_CenterAndRadius ("Center And Radius(W)", Vector) = (0,0,0,50)
		_Center2 ("Center2", Vector) = (0,0,0,0)
		[Header(Dark)] _DarkColor ("Dark Color", Vector) = (1,1,1,1)
		_DarkMinRange ("Dark Min Range", Range(0, 1)) = 0.5
		_DarkRangeMul ("Dark Range Mul", Range(0, 2)) = 1
		[Header(Shadow)] [KeywordEnum(Multiply, Color)] _ShadowMode ("Shadow Mode", Float) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		_ShadowColor ("Shadow Color", Vector) = (0,0,0,1)
		_ShadowMask ("Shadow Mask", Vector) = (0,0,0,0)
		[Header(PointLight)] [KeywordEnum(Off, On)] _PointLight ("Use PointLight", Float) = 0
		_PointId ("Point Id", Float) = 0
		_PointId2 ("Point Id2", Float) = 1
		_PointPowInv ("Point Pow Inv", Range(0.0001, 16)) = 1
		[Header(Other)] _StencilID ("StencilID", Float) = 2
		_OffsetFactor ("OffsetFactor", Float) = 3
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