//
//  TaskListView.swift
//  CoreDataWDH
//
//  Created by Joshua Rück on 20.03.24.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.tasks) { task in
                    HStack {
                        Button {
                            viewModel.toggleTask(task: task)
                        } label: {
                            Image(systemName: task.completed ? "checkmark.circle" : "circle")
                        }
                        Text(task.title ?? "")
                        Spacer()
                        Group {
                            if let picture = task.person?.picture {
                                Image(picture)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            } else {
                                Image(systemName: "person.badge.plus")
                            }
                        }
                        .onTapGesture {
                            viewModel.addPersonToTask(task: task)
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.delTask(task: task)
                        } label: {
                            Label("Trash", systemImage: "trash")
                        }
                    }
                }
                .navigationTitle("Tasks")
                
                HStack {
                    TextField("Task name", text: $viewModel.taskName)
                    Button {
                        viewModel.addTask()
                        viewModel.taskName = ""
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    TaskListView()
}
