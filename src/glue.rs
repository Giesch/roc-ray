use crate::bindings;
use core::fmt::Debug;
use roc_std::RocRefcounted;
use std::ffi::c_int;

#[derive(Clone, Copy, PartialEq)]
#[repr(C)]
pub struct RocColor(i64);

#[allow(dead_code)]
impl RocColor {
    pub const WHITE: RocColor = RocColor::from_rgba(255, 255, 255, 255);
    pub const BLACK: RocColor = RocColor::from_rgba(0, 0, 0, 255);
    pub const RED: RocColor = RocColor::from_rgba(255, 0, 0, 255);
    pub const GREEN: RocColor = RocColor::from_rgba(0, 255, 0, 255);
    pub const BLUE: RocColor = RocColor::from_rgba(0, 0, 255, 255);

    // keeping this in case we need it later
    pub const fn from_rgba(r: u8, g: u8, b: u8, a: u8) -> RocColor {
        let color = ((a as i64) << 24) | ((b as i64) << 16) | ((g as i64) << 8) | (r as i64);
        RocColor(color)
    }

    pub fn to_rgba(self) -> (u8, u8, u8, u8) {
        let a = ((self.0 >> 24) & 0xFF) as u8;
        let b = ((self.0 >> 16) & 0xFF) as u8;
        let g = ((self.0 >> 8) & 0xFF) as u8;
        let r = (self.0 & 0xFF) as u8;
        (r, g, b, a)
    }
}

impl Debug for RocColor {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let (r, g, b, a) = self.to_rgba();
        write!(f, "HostColor {{ r: {}, g: {}, b: {}, a: {} }}", r, g, b, a)
    }
}

impl From<RocColor> for bindings::Color {
    fn from(color: RocColor) -> bindings::Color {
        let (r, g, b, a) = color.to_rgba();
        bindings::Color { r, g, b, a }
    }
}

#[cfg(test)]
mod test_color {
    use super::*;

    #[test]
    fn test_from_rgba() {
        // Test full white (all components 255)
        assert_eq!(RocColor::WHITE.0, 0xFF_FF_FF_FF);

        // Test pure black with full opacity
        assert_eq!(RocColor::BLACK.0, 0xFF00_0000);

        // Test pure red with full opacity
        assert_eq!(RocColor::RED.0, 0xFF00_00FF);

        // Test pure green with full opacity
        assert_eq!(RocColor::GREEN.0, 0xFF00_FF00);

        // Test pure blue with full opacity
        assert_eq!(RocColor::BLUE.0, 0xFFFF_0000);

        // Test transparent black
        let transparent = RocColor::from_rgba(0, 0, 0, 0);
        assert_eq!(transparent.0, 0x0000_0000);
    }

    #[test]
    fn test_to_rgba() {
        // Test conversion back from full white
        let white = RocColor::from_rgba(255, 255, 255, 255);
        assert_eq!(white.to_rgba(), (255, 255, 255, 255));

        // Test conversion back from black
        assert_eq!(RocColor::BLACK.to_rgba(), (0, 0, 0, 255));

        // Test conversion back from pure red
        let red = RocColor::from_rgba(255, 0, 0, 255);
        assert_eq!(red.to_rgba(), (255, 0, 0, 255));

        // Test conversion back from semi-transparent color
        let semi_transparent = RocColor::from_rgba(128, 128, 128, 128);
        assert_eq!(semi_transparent.to_rgba(), (128, 128, 128, 128));
    }

    #[test]
    fn test_color_components() {
        // Test each component individually
        for i in 0..=255 {
            // Test red component
            let red = RocColor::from_rgba(i as u8, 0, 0, 255);
            assert_eq!(red.to_rgba().0, i as u8);

            // Test green component
            let green = RocColor::from_rgba(0, i as u8, 0, 255);
            assert_eq!(green.to_rgba().1, i as u8);

            // Test blue component
            let blue = RocColor::from_rgba(0, 0, i as u8, 255);
            assert_eq!(blue.to_rgba().2, i as u8);

            // Test alpha component
            let alpha = RocColor::from_rgba(0, 0, 0, i as u8);
            assert_eq!(alpha.to_rgba().3, i as u8);
        }
    }

    #[test]
    fn test_debug_format() {
        let color = RocColor::from_rgba(100, 150, 200, 255);
        assert_eq!(
            format!("{:?}", color),
            "HostColor { r: 100, g: 150, b: 200, a: 255 }"
        );
    }

    #[test]
    fn test_copy_clone() {
        let original = RocColor::from_rgba(123, 45, 67, 89);
        let copied = original;
        let cloned = original.clone();

        assert_eq!(original.0, copied.0);
        assert_eq!(original.0, cloned.0);
    }
}

#[derive(Clone, Copy, Default, Debug, PartialEq, PartialOrd)]
#[repr(C)]
pub struct RocVector2 {
    pub unused: i64,
    pub unused2: i64,
    pub unused3: i64,
    pub unused4: i64,
    pub x: f32,
    pub y: f32,
}

impl RocVector2 {
    pub fn to_components_c_int(&self) -> (c_int, c_int) {
        (self.x.round() as c_int, self.y.round() as c_int)
    }
}

impl From<&RocVector2> for bindings::Vector2 {
    fn from(vector: &RocVector2) -> bindings::Vector2 {
        bindings::Vector2 {
            x: vector.x,
            y: vector.y,
        }
    }
}

roc_std::roc_refcounted_noop_impl!(RocVector2);

#[derive(Clone, Copy, Default, Debug, PartialEq, PartialOrd)]
#[repr(C)]
pub struct RocRectangle {
    pub unused: i64,
    pub unused2: i64,
    pub unused3: i64,
    pub height: f32,
    pub width: f32,
    pub x: f32,
    pub y: f32,
}

impl RocRectangle {
    pub fn to_components_c_int(&self) -> (c_int, c_int, c_int, c_int) {
        (
            self.x as c_int,
            self.y as c_int,
            self.width as c_int,
            self.height as c_int,
        )
    }
}

impl From<&RocRectangle> for bindings::Rectangle {
    fn from(rectangle: &RocRectangle) -> bindings::Rectangle {
        bindings::Rectangle {
            x: rectangle.x,
            y: rectangle.y,
            width: rectangle.width,
            height: rectangle.height,
        }
    }
}

roc_std::roc_refcounted_noop_impl!(RocRectangle);
