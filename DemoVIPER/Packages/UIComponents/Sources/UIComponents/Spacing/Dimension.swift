//
//  Spacing.swift
//  
//
//  Created by vijay yadav on 09/02/23.
//

import UIKit

// Spaces
public enum Dimension: SpacingProtocol {
    private static let multiplier = 1.0
    /**
     * spacing13 === 2.0
     */
    public static var spacing13: Double {
        return 2.0 * multiplier
    }
    
    /**
     * spacing12 === 4.0
     */
    public static var spacing12: Double {
        return 4.0 * multiplier
    }
    
    /**
     * spacing12 === 6.0
     */
    
    public static var spacing12_1: Double {
        return 6.0 * multiplier
    }
    
    /**
     * spacing11 === 8.0
     */
    public static var spacing11: Double {
        return 8.0 * multiplier
    }
    
    /**
     * spacing11_1 === 10.0
     */
    public static var spacing11_1: Double {
        return 10.0 * multiplier
    }
    
    /**
     * spacing10 === 12.0
     */
    public static var spacing10: Double {
        return 12.0 * multiplier
    }
    
    /**
     * spacing10 === 14.0
     */
    public static var spacing10_1: Double {
        return 14.0 * multiplier
    }
    
    /**
     * spacing9 === 16.0
     */
    public static var spacing9: Double {
        return 16.0 * multiplier
    }
    
    /**
     * spacing9_1 === 20.0
     */
    public static var spacing9_1: Double {
        return 20.0 * multiplier
    }
    
    /**
     * spacing9_2 === 22.0
     */
    public static var spacing9_2: Double {
        return 22.0 * multiplier
    }
    
    /**
     * spacing8 === 24.0
     */
    public static var spacing8: Double {
        return 24.0 * multiplier
    }
    
    /**
     * spacing7 === 32.0
     */
    public static var spacing7: Double {
        return 32.0 * multiplier
    }
    
    /**
     * spacing6 === 40.0
     */
    public static var spacing6: Double {
        return 40.0 * multiplier
    }
    
    /**
     * spacing5 === 48.0
     */
    public static var spacing5: Double {
        return 48.0 * multiplier
    }
    
    /**
     * spacing4 === 56.0
     */
    public static var spacing4: Double {
        return 56.0 * multiplier
    }
    
    /**
     * spacing3 === 64.0
     */
    public static var spacing3: Double {
        return 64.0 * multiplier
    }
    
    /**
     * spacing2 === 72.0
     */
    public static var spacing2: Double {
        return 72.0 * multiplier
    }
    
    /**
     * spacing1 === 80.0
     */
    public static var spacing1: Double {
        return 80.0 * multiplier
    }
}

// Sizes
extension Dimension: SizeProtocol {
    /**
     * size1 === 64.0
     */
    public static var size1: CGFloat {
        return 64.0 * multiplier
    }
    
    /**
     * size1 === 60.0
     */
    public static var size1_1: CGFloat {
        return 60.0 * multiplier
    }
    
    /**
     * size1_2 === 56.0
     */
    public static var size1_2: CGFloat {
        return 56.0 * multiplier
    }
    
    /**
     * size1_3 === 52.0
     */
    public static var size1_3: CGFloat {
        return 52.0 * multiplier
    }
    
    /**
     * size1_4 === 48.0
     */
    public static var size1_4: CGFloat {
        return 48.0 * multiplier
    }
    
    /**
     * size1_5 === 44.0
     */
    public static var size1_5: CGFloat {
        return 44.0 * multiplier
    }
    
    /**
     * size1_75 === 40.0
     */
    public static var size1_75: CGFloat {
        return 40.0 * multiplier
    }
    
    /**
     * size1_6=== 36.0
     */
    public static var size1_6: CGFloat {
        return 36.0 * multiplier
    }
    
    /**
     * size2 === 32.0
     */
    public static var size2: CGFloat {
        return 32.0 * multiplier
    }
    
    /**
     * size2_6 === 28.0
     */
    public static var size2_6: CGFloat {
        return 28.0 * multiplier
    }
    
    /**
     * size2_25 === 26.0
     */
    public static var size2_25: CGFloat {
        return 26.0 * multiplier
    }
    
    /**
     * size2_5 === 24.0
     */
    public static var size2_5: CGFloat {
        return 24.0 * multiplier
    }
    
    /**
     * size2_26 === 30.0
     */
    
    public static var size2_26: CGFloat {
        return 30.0 * multiplier
    }
    
    /**
     * size2_3 === 20.0
     */
    
    public static var size2_3: CGFloat {
        return 20.0 * multiplier
    }
    
    /**
     * size2_1 === 18.0
     */
    
    public static var size2_1: CGFloat {
        return 18.0 * multiplier
    }
    
    /**
     * size3 === 16.0
     */
    public static var size3: CGFloat {
        return 16.0 * multiplier
    }
    
    /**
     * size4 === 12.0
     */
    public static var size4: CGFloat {
        return 12.0 * multiplier
    }
    
    /**
     * size5 === 8.0
     */
    public static var size5: CGFloat {
        return 8.0 * multiplier
    }
    
    /**
     * size6 === 2.0
     */
    public static var size6: Double {
        return 2.0 * multiplier
    }
}


// CornerRadius
extension Dimension: CornerRadiusProtocol {
    /**
     * radius_xs === 2.0
     */
    public static var radius_xs: CGFloat {
        return 2.0
    }
    
    /**
     * radius_s === 4.0
     */
    public static var radius_s: CGFloat {
        return 4.0
    }
    
    /**
     * radius_s === 6.0
     */
    public static var radius_s1: CGFloat {
        return 6.0
    }
    
    /**
     * radius_m === 8.0
     */
    public static var radius_m: CGFloat {
        return 8.0
    }
    
    /**
     * radius_l === 12.0
     */
    public static var radius_l: CGFloat {
        return 12.0
    }
    
    /**
     * radius_xl === 16.0
     */
    public static var radius_xl: CGFloat {
        return 16.0
    }
    
    /**
     * radius_xxl === 20.0
     */
    public static var radius_xxl: CGFloat {
        return 20.0
    }
}
