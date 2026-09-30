Shader "custom/AnimSpriteTPShader" {
	Properties {
		_Index ("Index", Float) = 0
		_Color ("Color", Vector) = (1,1,1,1)
		_0Tex ("0Tex", 2D) = "white" {}
		_1Tex ("1Tex", 2D) = "white" {}
		_2Tex ("2Tex", 2D) = "white" {}
		_3Tex ("3Tex", 2D) = "white" {}
		_Position ("Position", Vector) = (1,1,1,1)
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