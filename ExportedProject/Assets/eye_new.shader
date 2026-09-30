Shader "DianDian/TD/Eye_New" {
	Properties {
		[Header(Base)] _BaseMask ("Base Mask", 2D) = "white" {}
		[Toggle] _UseBaseMaskCol ("Use BaseMaskColor", Float) = 0
		_BaseColor ("Base Color", Vector) = (1,1,1,1)
		[NoScaleOffset] _EmissiveMask ("Emissive Mask", 2D) = "white" {}
		_EmissiveColor ("Emissive Color", Vector) = (1,1,1,1)
		[NoScaleOffset] _MaskMap ("Mask(R:Height G:Reflections)", 2D) = "black" {}
		_Offset ("Offset", Range(0, 1)) = 0
		[Header(Middle)] _MiddleColor ("Middle Color", Vector) = (1,1,1,1)
		_MiddleRange ("Middle Range", Range(0, 1)) = 0.5
		_MiddleEdge ("Middle Edge", Range(0, 0.5)) = 0
		[Header(Reflections)] [NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "black" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 1)) = 1
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