<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blade 页面权限控制</title>
    <style>
        :root {
            color: #1f2937;
            background: #f3f4f6;
            font-family: Inter, ui-sans-serif, system-ui, sans-serif;
        }

        body {
            margin: 0;
            padding: 24px;
        }

        main {
            max-width: 960px;
            margin: 0 auto;
        }

        h1 {
            margin: 0 0 8px;
            font-size: 24px;
        }

        p {
            margin: 0;
            color: #4b5563;
            line-height: 1.7;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 16px;
            margin-top: 20px;
        }

        section {
            padding: 20px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        h2 {
            margin: 0 0 12px;
            font-size: 16px;
        }

        code {
            display: block;
            padding: 12px;
            overflow-x: auto;
            color: #14532d;
            background: #f0fdf4;
            border-radius: 6px;
            font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
            font-size: 13px;
            line-height: 1.6;
            white-space: pre-wrap;
        }

        ul {
            margin: 0;
            padding-left: 20px;
            color: #4b5563;
            line-height: 1.8;
        }

    </style>
</head>
<body>
    <main>
        <h1>Blade 页面权限控制</h1>
        <p>菜单可见性和页面访问权限由同一条权限记录管理。</p>

        <div class="grid">
            <section>
                <h2>菜单权限</h2>
                <p>权限记录关联菜单后，只有拥有该权限的角色才会收到此菜单。</p>
                <code>admin_permission_menu
permission_id: 16
menu_id: 16</code>
            </section>

            <section>
                <h2>页面访问权限</h2>
                <p>iframe 请求进入后台路由组，权限中间件按路径校验当前用户。</p>
                <code>admin_permissions.http_path
/pages/blade_permission*</code>
            </section>

            <section>
                <h2>授权方式</h2>
                <ul>
                    <li>进入系统管理的角色页面。</li>
                    <li>为角色勾选“Blade 页面权限示例”。</li>
                    <li>重新登录后菜单与页面同时生效。</li>
                </ul>
            </section>

            <section class="full-width">
                <h2>控制器示例</h2>
                <p>控制器只负责返回视图，权限校验交由后台路由中间件统一处理。</p>
                <code>&lt;?php

class BladePermissionController extends AdminController
{
    public function index(): View
    {
        return view('admin.pages.blade_permission');
    }
}</code>
            </section>
        </div>
    </main>

    <script>
        /** 向后台通知页面实际高度，避免 iframe 内出现多余滚动区域。 */
        function reportHeight() {
            window.parent.postMessage({
                type: 'owl:iframe-height',
                height: document.documentElement.scrollHeight || document.body.scrollHeight,
            }, window.location.origin);
        }

        window.addEventListener('load', reportHeight);
        window.addEventListener('resize', reportHeight);
    </script>
</body>
</html>
