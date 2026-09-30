Shader "KingshotRepair/World"
{
    Properties
    {
        _BaseMap ("Base Map", 2D) = "white" {}
        _MainTex ("Main Tex", 2D) = "white" {}
        _SecondMap ("Second Map", 2D) = "white" {}
        _NoiseMap ("Noise Map", 2D) = "white" {}
        _MaskTex ("Mask", 2D) = "white" {}
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        _MainColor ("Main Color", Color) = (1,1,1,1)
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry" }

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

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
                fixed4 color : COLOR;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uvBase : TEXCOORD0;
                float2 uvMain : TEXCOORD1;
                float3 normal : TEXCOORD2;
                fixed4 color : COLOR;
            };

            v2f vert(appdata v)
            {
                v2f o;

                o.pos = UnityObjectToClipPos(v.vertex);
                o.uvBase = TRANSFORM_TEX(v.uv, _BaseMap);
                o.uvMain = TRANSFORM_TEX(v.uv, _MainTex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.color = v.color;

                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 baseTex = tex2D(_BaseMap, i.uvBase);
                fixed4 mainTex = tex2D(_MainTex, i.uvMain);

                fixed4 tex = lerp(baseTex, mainTex, saturate(_KSUseMainTex));

                fixed3 tint = lerp(_BaseColor.rgb, _MainColor.rgb,
                                   saturate(_KSUseMainTex));

                float3 n = normalize(i.normal);
                float3 lightDir = normalize(float3(0.35, 0.8, 0.45));

                float ndl = saturate(dot(n, lightDir));
                float lighting = 0.65 + ndl * 0.35;

                return fixed4(tex.rgb * tint * lighting, tex.a);
            }
            ENDCG
        }
    }

    Fallback "Diffuse"
}