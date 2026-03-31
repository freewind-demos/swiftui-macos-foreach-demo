# SwiftUI macOS ForEach 循环视图

## 简介

演示 SwiftUI 中 ForEach 的用法，用于循环渲染视图。

## 快速开始

```bash
cd swiftui-macos-foreach-demo
xcodegen generate
open SwiftUIForEachDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 ForEach

```swift
ForEach(items) { item in
    ItemRow(item)
}
```

ForEach 需要数据集合中的元素符合 `Identifiable` 协议，或者指定 `id:` 参数。

### Identifiable 协议

```swift
struct Item: Identifiable {
    let id = UUID()  // 自动生成唯一ID
    let name: String
}
```

### Range + ForEach

```swift
ForEach(1..<10, id: \.self) { number in
    Text("\(number)")
}
```

使用 `id: \.self` 表示用元素本身作为唯一标识。

### 在 Grid 中使用

```swift
LazyVGrid(columns: [
    GridItem(.flexible()),
    GridItem(.flexible())
], spacing: 10) {
    ForEach(items) { item in
        ItemView(item)
    }
}
```

## 完整示例

```swift
struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ContentView: View {
    @State private var fruits = [
        Fruit(name: "苹果", color: .red),
        Fruit(name: "香蕉", color: .yellow)
    ]

    var body: some View {
        ForEach(fruits) { fruit in
            HStack {
                Circle()
                    .fill(fruit.color)
                    .frame(width: 20, height: 20)
                Text(fruit.name)
            }
        }
    }
}
```

## 完整讲解（中文）

### ForEach 的作用

ForEach 是 SwiftUI 的循环组件，相当于 Swift 的 `for` 循环，但用于构建视图。

### ForEach vs List

| 特性 | ForEach | List |
|------|---------|------|
| 用途 | 在 HStack/VStack 中循环 | 显示可滚动的列表 |
| 选择 | 不支持 | 支持 |
| 性能 | 需要手动优化 | 自动优化 |

### 注意事项

ForEach 中的元素必须唯一，用 `Identifiable` 确保每个元素有唯一标识。
