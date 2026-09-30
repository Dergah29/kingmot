Shader "DianDian/TD/Character_Outline_Editor" {
	Properties {
		[Header(Outline)] [NoScaleOffset] _OutlineMap ("Outline Map", 2D) = "black" {}
		_OutlineCol1 ("Outline Color1", Vector) = (0,0,0,1)
		_OutlineCol2 ("Outline Color2", Vector) = (0,0,0,1)
		_OutlineCol3 ("Outline Color3", Vector) = (0,0,0,1)
		_OutlineCol4 ("Outline Color4", Vector) = (0,0,0,1)
		_OutlineCol5 ("Outline Color5", Vector) = (0,0,0,1)
		_OutlineCol6 ("Outline Color6", Vector) = (0,0,0,1)
		_OutlineCol7 ("Outline Color7", Vector) = (0,0,0,1)
		_OutlineCol8 ("Outline Color8", Vector) = (0,0,0,1)
		_OutlineCol9 ("Outline Color9", Vector) = (0,0,0,1)
		_OutlineCol10 ("Outline Color10", Vector) = (0,0,0,1)
		_OutlineWidth ("Outline Width", Range(0, 50)) = 1
		_OutlineStrength ("Outline Color Strength", Range(0.01, 10)) = 1
		_Stencil ("Stencil ID", Float) = 1
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