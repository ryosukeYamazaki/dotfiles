;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-

;; パッケージ管理は straight.el に統一する。
;; package.el が init.el より先にパッケージを有効化するのを防ぐ。
(setq package-enable-at-startup nil)
