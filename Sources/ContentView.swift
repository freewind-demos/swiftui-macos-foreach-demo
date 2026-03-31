import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ContentView: View {
    @State private var items = [
        Item(name: "苹果", color: .red),
        Item(name: "香蕉", color: .yellow),
        Item(name: "葡萄", color: .purple),
        Item(name: "橙子", color: .orange),
        Item(name: "西瓜", color: .green)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // ForEach 基础用法
                Text("ForEach 基础用法")
                    .font(.headline)

                ForEach(items) { item in
                    HStack {
                        Circle()
                            .fill(item.color)
                            .frame(width: 30, height: 30)
                        Text(item.name)
                        Spacer()
                    }
                    .padding()
                    .background(Color(nsColor: .controlBackgroundColor))
                    .cornerRadius(8)
                }

                Divider()

                // ForEach + Range
                Text("ForEach + Range")
                    .font(.headline)

                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 10) {
                    ForEach(1..<10, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 50, height: 50)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }

                Divider()

                // 动态添加/删除
                Text("动态列表 (添加/删除)")
                    .font(.headline)

                ForEach(items) { item in
                    HStack {
                        Circle()
                            .fill(item.color)
                            .frame(width: 20, height: 20)
                        Text(item.name)
                        Spacer()
                        Button("删除") {
                            items.removeAll { $0.id == item.id }
                        }
                        .buttonStyle(.borderless)
                        .foregroundColor(.red)
                    }
                }

                Button("添加新项目") {
                    let newItem = Item(
                        name: "新水果 \(Int.random(in: 1...100))",
                        color: Color.random()
                    )
                    items.append(newItem)
                }
            }
            .padding()
        }
    }
}

extension Color {
    static func random() -> Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
