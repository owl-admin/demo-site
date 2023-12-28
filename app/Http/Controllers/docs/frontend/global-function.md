> 前端提供了一些前端方法, 可在后端 `amis` 中 通过 `window` 调用

## __退出登录__

```js
window.$owl.logout()
```

<br>

## __登录成功后的回调__

```js
window.$owl.afterLoginSuccess({
	username: string,
	password: string
}, token)
```

<br>

## __刷新当前 amis 页面__

仅刷新 `content` 部分, 不会刷新 `layout` 部分, 仅在 `amis` 页面中生效

```js
window.$owl.refreshAmisPage()
```

<br>

## __刷新前端路由__

```js
// 重新获取菜单及路由
window.$owl.refreshRoutes()
```

<br>

## __根据 path 关闭tab__

```js
window.$owl.closeTabByPath(path)
```
