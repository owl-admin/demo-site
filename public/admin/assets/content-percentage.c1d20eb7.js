import{z as f,r as e,v as g,A as m,s as o,a5 as h,D as x}from"./index.fef4c77f.js";import{i as y,T as F}from"./index.382b0d6a.js";import{D as C}from"./index.4937306e.js";function k(){const a=f(y),[s,n]=e.exports.useState([]),[i,r]=e.exports.useState(!0),l=()=>{r(!0),x.get("/api/workplace/content-percentage").then(t=>{n(t.data)}).finally(()=>{r(!1)})};return e.exports.useEffect(()=>{l()},[]),g(m,{children:[o(F.Title,{heading:6,children:a["workplace.contentPercentage"]}),o(h,{loading:i,style:{display:"block"},children:o(C,{autoFit:!0,height:340,data:s,radius:.7,innerRadius:.65,angleField:"count",colorField:"type",color:["#21CCFF","#313CA9","#249EFF"],interactions:[{type:"element-single-selected"}],tooltip:{showMarkers:!1},label:{visible:!0,type:"spider",formatter:t=>`${(t.percent*100).toFixed(0)}%`,style:{fill:"#86909C",fontSize:14}},legend:{position:"bottom"},statistic:{title:{style:{fontSize:"14px",lineHeight:2,color:"rgb(--var(color-text-1))"},formatter:()=>"\u5185\u5BB9\u91CF"},content:{style:{fontSize:"16px",color:"rgb(--var(color-text-1))"},formatter:(t,c)=>{const p=c.reduce((u,d)=>u+d.count,0);return Number(p).toLocaleString()}}}})})]})}export{k as default};