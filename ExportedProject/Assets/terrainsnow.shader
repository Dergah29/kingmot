Shader "DianDian/Terrain/Snow" {
	Properties {
		_MaskTex ("Mask", 2D) = "black" {}
		_Color ("Color", Vector) = (1,1,1,1)
		[Header(Snow)] _SnowColor1 ("SnowColor1", Vector) = (1,1,1,1)
		_SnowColor2 ("SnowColor2", Vector) = (1,1,1,1)
		_SnowColor3 ("SnowColor3", Vector) = (1,1,1,1)
		[Header(Smoothness)] _SmoothnessTex ("Smoothness Tex", 2D) = "black" {}
		_SmoothnessScale ("Smoothness Scale", Range(0, 1)) = 0.5
		_SmoothnessRoughness ("Smoothness Roughness", Range(0, 1)) = 0.02
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_OffsetFactor ("OffsetFactor", Float) = 0
		_OffsetUnits ("OffsetUnits", Float) = 0
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

			float4 _Color;

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return _Color; // RGBA
			}

			ENDHLSL
		}
	}
}