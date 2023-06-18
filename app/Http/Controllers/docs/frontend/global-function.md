> 前端提供了一些前端方法, 可在后端 `amis` 中 通过 `window` 调用

## 退出登录

```js
window.$owl.logout()
```

<br>

## 登录成功后的回调

```js
window.$owl.afterLoginSuccess({
	username: string,
	password: string
}, token)
```

<br>

## 刷新当前 amis 页面

仅刷新 `content` 部分, 不会刷新 `layout` 部分, 仅在 `amis` 页面中生效

```js
window.$owl.refreshAmisPage()
```

<br>

## 刷新前端路由

```js
// 重新获取菜单及路由
window.$owl.refreshRoutes()
```

<br>

## 根据 path 关闭tab

```js
window.$owl.closeTabByPath(path)
```