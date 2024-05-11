//
//  BurgerView.swift
//  CoreGraphicsExamples
//
//  Created by Jaehun Lee on 5/11/24.
//

import UIKit

final class BurgerView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // MARK: Draw with UIBezierPath
        makeBottomBunPath(rect).stroke()
        makePatty(rect).fill()
        makeLettuce(rect).stroke()
        makeSlicedTomato(rect).stroke()
        makeSirarachaSource(rect).stroke()
        makeTopBun(rect).stroke()
        
        // MARK: Draw without UIBezierPath
        drawBottomBun(rect, context: context)
        drawPatty(rect, context: context)
        drawLettuce(rect, context: context)
        drawSlicedTomato(rect, context: context)
        drawSirarachaSource(rect, context: context)
        drawTopBun(rect, context: context)
    }
    
    private func makeBottomBunPath(_ rect: CGRect) -> UIBezierPath {
        UIColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0).setStroke()
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: rect.width * 0.1,
                y: rect.height * 0.7625,
                width: rect.width * 0.80,
                height: rect.height * 0.125),
            cornerRadius: 10
        )
        path.lineWidth = 8
        return path
    }
    
    private func makePatty(_ rect: CGRect) -> UIBezierPath {
        UIColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0).setFill()
        let path = UIBezierPath(
            roundedRect: CGRect(
                x: rect.width * 0.075,
                y: rect.height * 0.6125 ,
                width: rect.width * 0.85,
                height: rect.height * 0.1),
            cornerRadius: 15
        )
        return path
    }
    
    private func makeLettuce(_ rect: CGRect) -> UIBezierPath {
        UIColor.green.setStroke()
        let points: [CGPoint] = stride(from: rect.width * 0.1,
                                       through: rect.width * 0.9,
                                       by: (rect.width * 0.8) / 9)
            .map { CGPoint(x: $0, y: rect.height * 0.5575) }
        var controlPoints: [CGPoint] = []
        
        for i in 0..<9 {
            controlPoints.append(
                CGPoint(
                    x: points[i].x + 0.5 * (rect.width * 0.8) / 10,
                    y: i % 2 == 0 ? points[i].y + rect.height * 0.05 : points[i].y - rect.height * 0.05
                )
            )
        }
        
        let path = UIBezierPath()
        path.move(to: points[0])
        for i in 1..<10 {
            path.addQuadCurve(to: points[i], controlPoint: controlPoints[i - 1])
        }
        path.lineWidth = 10
        path.lineCapStyle = .round
        return path
    }
    
    private func makeSlicedTomato(_ rect: CGRect) -> UIBezierPath {
        UIColor.red.setStroke()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width * 0.125, y: rect.height * 0.4625))
        path.addLine(to: CGPoint(x: rect.width * 0.475, y: rect.height * 0.4625))
        path.move(to: CGPoint(x: rect.width * 0.525, y: rect.height * 0.4625))
        path.addLine(to: CGPoint(x: rect.width * 0.875, y: rect.height * 0.4625))
        path.lineWidth = 15
        return path
    }
    
    private func makeSirarachaSource(_ rect: CGRect) -> UIBezierPath {
        let startPoints: [CGPoint] = stride(from: rect.width * 0.075,
                                            through: rect.width * 0.875,
                                            by: (rect.width * 0.8) / 19)
            .map { CGPoint(x: $0, y: rect.height * 0.3625 ) }
        let endPoints: [CGPoint] = stride(from: rect.width * 0.125,
                                          through: rect.width * 0.925,
                                          by: (rect.width * 0.8) / 19)
            .map { CGPoint(x: $0, y: rect.height * 0.4125) }
        
        UIColor.orange.setStroke()
        let path = UIBezierPath()
        path.lineWidth = 3
        for i in 0..<20 {
            path.move(to: startPoints[i])
            path.addLine(to: endPoints[i])
        }
        return path
    }
    
    private func makeTopBun(_ rect: CGRect) -> UIBezierPath {
        UIColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0).setStroke()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3125))
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.1125),
                          controlPoint: CGPoint(x: rect.width * 0.15, y: rect.height * 0.1125))
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.3125),
                          controlPoint: CGPoint(x: rect.width * 0.85, y: rect.height * 0.1125))
        path.addLine(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3125))
        path.lineWidth = 8
        return path
    }
    
    private func drawBottomBun(_ rect: CGRect, context: CGContext) {
        context.addPath(
            CGPath(
                roundedRect: CGRect(
                    x: rect.width * 0.1,
                    y: rect.height * 0.7625,
                    width: rect.width * 0.80,
                    height: rect.height * 0.125),
                cornerWidth: 10,
                cornerHeight: 10,
                transform: nil
            )
        )
        context.setLineWidth(8)
        context.setStrokeColor(CGColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0))
        context.drawPath(using: .stroke)
    }
    
    private func drawPatty(_ rect: CGRect, context: CGContext) {
        context.addPath(
            CGPath(
                roundedRect: CGRect(
                    x: rect.width * 0.075,
                    y: rect.height * 0.6125 ,
                    width: rect.width * 0.85,
                    height: rect.height * 0.1),
                cornerWidth: 15,
                cornerHeight: 15,
                transform: nil
            )
        )
        context.setFillColor(CGColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0))
        context.drawPath(using: .fill)
    }
    
    private func drawLettuce(_ rect: CGRect, context: CGContext) {
        let points: [CGPoint] = stride(from: rect.width * 0.1,
                                       through: rect.width * 0.9,
                                       by: (rect.width * 0.8) / 9)
            .map { CGPoint(x: $0, y: rect.height * 0.5575) }
        var controlPoints: [CGPoint] = []
        
        for i in 0..<9 {
            controlPoints.append(
                CGPoint(
                    x: points[i].x + 0.5 * (rect.width * 0.8) / 10,
                    y: i % 2 == 0 ? points[i].y + rect.height * 0.05 : points[i].y - rect.height * 0.05
                )
            )
        }
        
        context.move(to: points[0])
        for i in 1..<10 {
            context.addQuadCurve(to: points[i], control: controlPoints[i - 1])
        }
        context.setLineWidth(10)
        context.setLineCap(.round)
        context.setStrokeColor(CGColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
        context.drawPath(using: .stroke)
    }
    
    private func drawSlicedTomato(_ rect: CGRect, context: CGContext) {
        context.move(to: CGPoint(x: rect.width * 0.125, y: rect.height * 0.4625))
        context.addLine(to: CGPoint(x: rect.width * 0.475, y: rect.height * 0.4625))
        context.move(to: CGPoint(x: rect.width * 0.525, y: rect.height * 0.4625))
        context.addLine(to: CGPoint(x: rect.width * 0.875, y: rect.height * 0.4625))
        context.setLineWidth(15)
        context.setLineCap(.butt)
        context.setStrokeColor(CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        context.drawPath(using: .stroke)
    }
    
    private func drawSirarachaSource(_ rect: CGRect, context: CGContext) {
        let startPoints: [CGPoint] = stride(from: rect.width * 0.075,
                                            through: rect.width * 0.875,
                                            by: (rect.width * 0.8) / 19)
            .map { CGPoint(x: $0, y: rect.height * 0.3625 ) }
        let endPoints: [CGPoint] = stride(from: rect.width * 0.125,
                                          through: rect.width * 0.925,
                                          by: (rect.width * 0.8) / 19)
            .map { CGPoint(x: $0, y: rect.height * 0.4125) }
        
        context.setStrokeColor(CGColor(red: 1.0, green: 117/255, blue: 0.0, alpha: 1.0))
        context.setLineWidth(3)
        for i in 0..<20 {
            context.move(to: startPoints[i])
            context.addLine(to: endPoints[i])
        }
        context.drawPath(using: .stroke)
    }
    
    private func drawTopBun(_ rect: CGRect, context: CGContext) {
        context.move(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3125))
        context.addQuadCurve(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.1125),
                             control: CGPoint(x: rect.width * 0.15, y: rect.height * 0.1125))
        context.addQuadCurve(to: CGPoint(x: rect.width * 0.9, y: rect.height * 0.3125),
                             control: CGPoint(x: rect.width * 0.85, y: rect.height * 0.1125))
        context.addLine(to: CGPoint(x: rect.width * 0.1, y: rect.height * 0.3125))
        context.setLineWidth(8)
        context.setStrokeColor(CGColor(red: 142/255, green: 91/255, blue: 45/255, alpha: 1.0))
        context.drawPath(using: .stroke)
    }
}
