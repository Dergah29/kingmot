Shader "KingshotRepair/Transparent"
{
    Properties
    {
        _BaseMap ("Base Map", 2D) = "white" {}
        _MainTex ("Main Tex", 2D) = "white" {}
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        _MainColor ("Main Color", Color) = (1,1,1,1)
        _KSUseMainTex ("Use Main Tex", Float) = 0
        _KSAlpha ("Alpha", Range(0,1)) = 0.75
    }

    SubShader
    {
        Tags
        {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }

        Blend SrcAlpha OneMinusSrcAlpha
        ZWrite Off
        Cull Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _BaseMap;
            sampler2D _MainTex;

            float4 _BaseMap_ST;
            float4 _MainTex_ST;

            fixed4 _BaseColor;
            fixed4 _MainColor;

            float _KSUseMainTex;
            float _KSAlpha;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uvBase : TEXCOORD0;
                float2 uvMain : TEXCOORD1;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uvBase = TRANSFORM_TEX(v.uv, _BaseMap);
                o.uvMain = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 baseTex = tex2D(_BaseMap, i.uvBase);
                fixed4 mainTex = tex2D(_MainTex, i.uvMain);

                fixed4 tex =
                    lerp(baseTex, mainTex, saturate(_KSUseMainTex));

                fixed3 tint =
                    lerp(_BaseColor.rgb,
                         _MainColor.rgb,
                         saturate(_KSUseMainTex));

                return fixed4(
                    tex.rgb * tint,
                    tex.a * _KSAlpha
                );
            }
            ENDCG
        }
    }

    Fallback "Transparent/Diffuse"
}