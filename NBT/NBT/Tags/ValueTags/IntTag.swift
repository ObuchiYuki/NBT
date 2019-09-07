//
//  IntTag.swift
//  NBTCoder
//
//  Created by yuki on 2019/09/06.
//  Copyright © 2019 yuki. All rights reserved.
//

import Foundation

public class IntTag: IntegerTag<Int32> {

    override func tagID() -> TagID { .int }
    
    override public func serializeValue(into dos: DataWriteStream, maxDepth: Int) throws {
        try value.map{ try dos.write($0) }
    }
    
    override public func deserializeValue(from dis: DataReadStream, maxDepth: Int) throws {
        self.value = try dis.int32()
    }
    
    override public func valueString(maxDepth: Int) -> String {
        return value.map{"\($0)"} ?? "nil"
    }
}
