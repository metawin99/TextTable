//
//  FancyGridFormat.swift
//  TextTable
//
//  Created by Cristian Filipov on 8/13/16.
//
//

import Foundation

extension Format {
    public class FancyGrid: TextTableFormatter {
        public static var requiresWidth: Bool { return true }

        public var string: String = ""
        public var width: Int? = nil
        public var align: Alignment = .left

        private var row: Int = 0
        private var contentStack: [String] = []

        public static func escape(_ s: String) -> String {
            return s
        }
        
        public func beginTable() { }

        public func endTable() {
            string.append("╘═")
            string.append(contentStack
                .map{$0.replaceAll("═")}
                .joined(separator: "═╧═"))
            string.append("═╛")
            string.append("\n")
        }

        public func beginHeaderRow() { }

        public func endHeaderRow() {
            string.append("╒═")
            string.append(contentStack
                .map{$0.replaceAll("═")}
                .joined(separator: "═╤═"))
            string.append("═╕")
            string.append("\n")
            string.append("│ ")
            string.append(contentStack.joined(separator: " | "))
            string.append(" │")
            string.append("\n")
            contentStack.removeAll()
        }

        public func beginRow() {
            contentStack.removeAll()
        }

        public func endRow() {
            if row == 0 {
                string.append("╞═")
                string.append(contentStack
                    .map{$0.replaceAll("═")}
                    .joined(separator: "═╪═"))
                string.append("═╡")
                string.append("\n")
            } else {
                string.append("├─")
                string.append(contentStack
                    .map{$0.replaceAll("─")}
                    .joined(separator: "─┼─"))
                string.append("─┤")
                string.append("\n")
            }
            string.append("│ ")
            string.append(contentStack.joined(separator: " │ "))
            string.append(" │")
            string.append("\n")
            row += 1
        }

        public func beginHeaderColumn() { }
        public func endHeaderColumn() { }
        public func beginColumn() { }
        public func endColumn() { }

        public func content(_ s: String) {
            if let width = width {
                contentStack.append(s.pad(align, length: width))
            } else {
                contentStack.append(s)
            }
        }
    }
}
